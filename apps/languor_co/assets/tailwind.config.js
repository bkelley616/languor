const defaultTheme = require("tailwindcss/defaultTheme")

module.exports = {
  mode: "jit",
  purge: [
    "./js/**/*.js",
    "../lib/*_web/**/*.*ex",
    "../lib/languor_co_web/live/**/*.sface",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter", ...defaultTheme.fontFamily.sans],
      },
      colors:{
        "primary": "var(--primary)",
        "secondary": "var(--secondary)",
        "smoke-light": "var(--smoke-light)",
        "smoke": "var(--smoke)",
        "smoke-dark": "var(--smoke-dark)",
      },
      spacing: {
        '140': '35rem',
      }
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}