const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  darkMode: 'class',
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['-apple-system', 'BlinkMacSystemFont', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        ruby: {
          50: '#fdf2f6',
          100: '#fce7ef',
          200: '#fad0e0',
          300: '#f7aac5',
          400: '#f27ba3',
          500: '#e94989',
          600: '#d91e5b',
          700: '#bc124a',
          800: '#9c1141',
          900: '#83123b',
          950: '#50051f',
        },
        teal: {
          50: '#f0fdfb',
          100: '#ccfbf5',
          200: '#99f6ea',
          300: '#5eeadc',
          400: '#2dd4c6',
          500: '#14b8a8',
          600: '#0d9488',
          700: '#0f766e',
          800: '#115e59',
          900: '#134e4a',
          950: '#042f2c',
        },
      },
      animation: {
        'pulse-slow': 'pulse 3s cubic-bezier(0.4, 0, 0.6, 1) infinite',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}