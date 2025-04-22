class ReportsController < ApplicationController
  def show
    
    @report = {
      id: 1,
      domain: "example.com",
      created_at: "2025-04-21 22:11:07 UTC",
      updated_at: "2025-04-21 22:11:07 UTC",
      version: "1.0",
      generated_by: "Oktoboot System",
      subdomains_count: 10,
      new_subdomains: 3,
      exposed_assets_count: 5,
      leaked_credentials_count: 3,
      dns: [
        {
          total_domains: 5,
          ns_records: [
            { name: "ns1.example.com", ip: "192.0.2.1" },
            { name: "ns2.example.com", ip: "192.0.2.2" }
          ],
          mx_records: [
            { name: "mail.example.com", ip: "198.51.100.2" }
          ]
        }
      ],
      exposed_assets: [
        {
          ip: "203.0.113.5",
          domain: "asset.example.com",
          isp: "ISP Corp",
          open_ports: [
            { port: 80, module: "http", version: "1.1", ssl: "N/A" }
          ],
          vulnerabilities: [
            {
              cve: "CVE-2023-1234",
              severity: "Critical",
              description: "Inappropriate implementation in Intents in Google Chrome on Android prior to 111.0.5563.64 allowed a remote attacker to perform domain spoofing via a crafted HTML page."
            }
          ],
          mitigation: "Patch to latest version"
        }
      ],
      shared_hosting: {
        domain: "shared1.com",
        shared_with: ["other1.com", "other2.com"]
      },
      whois: {
        registrar: "Registrar A",
        created: "2020-01-01",
        updated: "2023-01-01",
        expires: "2025-01-01"
      },
      exposed_asset: {
        ip: "203.0.113.5",
        domain: "asset.example.com",
        isp: "ISP Corp",
        vulnerability: {
          cvss: "Critical severity — CVSS: 9.8",
          description: "Sample vuln description"
        },
        recommendation: "Patch to latest version"
      },
      leaks: {
        logstealer: [
          { url: "siteA", email: "user1@example.com", password: "pass1", year: 2021 },
          { url: "siteB", email: "user2@example.com", password: "pass2", year: 2022 }
        ],
        public: [
          { leak_source: "publicSite", email: "user3@example.com", password: "pass3", year: 2020 }
        ]
      },
      employees: [
        { name: "Alice Example", role: "Engineer" },
        { name: "Bob Example", role: "Manager" }
      ],
      files: [
        { name: "document.pdf", url: "https://example.com/document.pdf" }
      ],
      methodology: [
        {
          title: "Domain & DNS Intelligence",
          icon: "fas fa-globe",
          steps: [
            {
              title: "DNS Record Enumeration",
              status: "completed",
              description: "Fetched DNS records"
            },
            {
              title: "WHOIS Enumeration",
              status: "completed",
              description: "Gathered WHOIS info"
            }
          ]
        },
        {
          title: "Network & Infrastructure",
          icon: "fas fa-network-wired",
          steps: [
            {
              title: "ASN Enumeration",
              status: "in-progress",
              description: "Collecting ASN data"
            }
          ]
        }
      ],
      network: {
        total_asns: 3,
        shared_hosting: {
          domain: "shared1.com",
          shared_with: ["other1.com", "other2.com"]
        }
      }
    }

    
  end

  def export_pdf
    @report = {
      id: 1,
      domain: "example.com",
      created_at: "2025-04-21 22:11:07 UTC",
      updated_at: "2025-04-21 22:11:07 UTC",
      version: "1.0",
      generated_by: "Oktoboot System",
      subdomains_count: 10,
      new_subdomains: 3,
      exposed_assets_count: 5,
      leaked_credentials_count: 3,
      dns: [
        {
          total_domains: 5,
          ns_records: [
            { name: "ns1.example.com", ip: "192.0.2.1" },
            { name: "ns2.example.com", ip: "192.0.2.2" }
          ],
          mx_records: [
            { name: "mail.example.com", ip: "198.51.100.2" }
          ]
        }
      ],
      exposed_assets: [
        {
          ip: "203.0.113.5",
          domain: "asset.example.com",
          isp: "ISP Corp",
          open_ports: [
            { port: 80, module: "http", version: "1.1", ssl: "N/A" }
          ],
          vulnerabilities: [
            {
              cve: "CVE-2023-1234",
              severity: "Critical",
              description: "Inappropriate implementation in Intents in Google Chrome on Android prior to 111.0.5563.64 allowed a remote attacker to perform domain spoofing via a crafted HTML page."
            }
          ],
          mitigation: "Patch to latest version"
        }
      ],
      shared_hosting: {
        domain: "shared1.com",
        shared_with: ["other1.com", "other2.com"]
      },
      whois: {
        registrar: "Registrar A",
        created: "2020-01-01",
        updated: "2023-01-01",
        expires: "2025-01-01"
      },
      exposed_asset: {
        ip: "203.0.113.5",
        domain: "asset.example.com",
        isp: "ISP Corp",
        vulnerability: {
          cvss: "Critical severity — CVSS: 9.8",
          description: "Sample vuln description"
        },
        recommendation: "Patch to latest version"
      },
      leaks: {
        logstealer: [
          { url: "siteA", email: "user1@example.com", password: "pass1", year: 2021 },
          { url: "siteB", email: "user2@example.com", password: "pass2", year: 2022 }
        ],
        public: [
          { leak_source: "publicSite", email: "user3@example.com", password: "pass3", year: 2020 }
        ]
      },
      employees: [
        { name: "Alice Example", role: "Engineer" },
        { name: "Bob Example", role: "Manager" }
      ],
      files: [
        { name: "document.pdf", url: "https://example.com/document.pdf" }
      ],
      methodology: [
        {
          title: "Domain & DNS Intelligence",
          icon: "fas fa-globe",
          steps: [
            {
              title: "DNS Record Enumeration",
              status: "completed",
              description: "Fetched DNS records"
            },
            {
              title: "WHOIS Enumeration",
              status: "completed",
              description: "Gathered WHOIS info"
            }
          ]
        },
        {
          title: "Network & Infrastructure",
          icon: "fas fa-network-wired",
          steps: [
            {
              title: "ASN Enumeration",
              status: "in-progress",
              description: "Collecting ASN data"
            }
          ]
        }
      ],
      network: {
        total_asns: 3,
        shared_hosting: {
          domain: "shared1.com",
          shared_with: ["other1.com", "other2.com"]
        }
      }
    }
    pdf_html = render_to_string(template: 'reports/pdf', locals: { report: @report })
    pdf = WickedPdf.new.pdf_from_string(pdf_html)

    send_data pdf, filename: "threat_report_#{@report[:domain]}.pdf", type: "application/pdf", disposition: "inline"
  end


  
end
