const puppeteer = require('puppeteer');
const fs = require('fs');
const path = require('path');
const Handlebars = require('handlebars');





Handlebars.registerHelper('json', function (context) {
  return JSON.stringify(context);
});

Handlebars.registerHelper('encodeURIComponent', function (context) {
  return encodeURIComponent(context);
});

Handlebars.registerHelper('formatDate', function (date, format) {
  if (!date) return 'N/A';
  const d = new Date(date);
  if (!format) {
    const months = ['January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'];
    return `${months[d.getMonth()]} ${d.getDate()}, ${d.getFullYear()}`;
  }
  return format
    .replace('YYYY', d.getFullYear())
    .replace('MM', String(d.getMonth() + 1).padStart(2, '0'))
    .replace('DD', String(d.getDate()).padStart(2, '0'))
    .replace('HH', String(d.getHours()).padStart(2, '0'))
    .replace('mm', String(d.getMinutes()).padStart(2, '0'))
    .replace('ss', String(d.getSeconds()).padStart(2, '0'));
});


Handlebars.registerHelper('exists', function (value, options) {
  if (value && (typeof value === 'string' ? value.trim() !== '' : true)) {
    return options.fn(this);
  }
  return options.inverse(this);
});



async function generatePdf(templatePath, dataPath, outputPath) {
  try {
    console.log(`Starting PDF generation:
    - Template: ${templatePath}
    - Data: ${dataPath}
    - Output: ${outputPath}`);

    // all the data here
    const rawData = JSON.parse(fs.readFileSync(dataPath, 'utf8'));
    const logoPath = path.join(__dirname, 'public', '3.png');
    const logoBase64 = fs.existsSync(logoPath)
    ? fs.readFileSync(logoPath).toString('base64')
    : null;
    const reportData = {
      ...rawData,
      riskChart: Array.isArray(rawData.riskChart) ?
        rawData.riskChart.map(Number) :  
        [0, 0, 0],

       assetChart: Array.isArray(rawData.assetChart) ?
        rawData.assetChart.map(Number) :  
        [0, 0, 0],

        logo: logoBase64 ? `data:image/png;base64,${logoBase64}` : null,
    };


    const templateSource = fs.readFileSync(templatePath, 'utf8');
    const template = Handlebars.compile(templateSource);
    const processedHtml = template(reportData);

    
    const tempHtmlPath = outputPath.replace('.pdf', '_temp.html');
    fs.writeFileSync(tempHtmlPath, processedHtml);


    const browser = await puppeteer.launch({
      headless: 'new',
      args: ['--no-sandbox', '--disable-setuid-sandbox']
    });
    const page = await browser.newPage();

    // Set viewport and load HTML
    await page.setViewport({ width: 1200, height: 1600, deviceScaleFactor: 1 });
    await page.goto(`file://${path.resolve(tempHtmlPath)}`, {
      waitUntil: 'networkidle0',
      timeout: 30000
    });


    await page.waitForFunction(() => {
      try {
        const canvases = Array.from(document.querySelectorAll('canvas'));
        return canvases.length > 0 &&
          canvases.every(c => c.getContext('2d'));
      } catch (e) {
        return false;
      }
    }, { timeout: 10000 });

   
    await page.screenshot({
      path: outputPath.replace('.pdf', '_debug.png'),
      fullPage: true
    });

    
    await page.pdf({
      path: outputPath,
      format: 'A4',
      printBackground: true,
      margin: { top: '20px', right: '20px', bottom: '20px', left: '20px' }
    });

    
    await browser.close();
    fs.unlinkSync(tempHtmlPath);

    console.log(`PDF generated successfully at: ${outputPath}`);
    return true;
  } catch (error) {
    console.error('PDF generation failed:', error);
    return false;
  }
}


const args = process.argv.slice(2);
if (args.length !== 3) {
  console.error('Usage: node generate_pdf.js <template_path> <data_path> <output_path>');
  process.exit(1);
}

generatePdf(args[0], args[1], args[2]).then(success => {
  process.exit(success ? 0 : 1);
});