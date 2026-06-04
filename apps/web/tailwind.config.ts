import type { Config } from 'tailwindcss';

export default {
  content: ['./app/**/*.{ts,tsx}', './components/**/*.{ts,tsx}'],
  theme: {
    extend: {
      colors: {
        navy: '#080B12',
        surface: '#1A1F2B',
        gold: '#D4AF37',
        teal: '#0D9488',
        offwhite: '#F8FAFC',
        silver: '#94A3B8'
      },
      fontFamily: {
        display: ['Cormorant Garamond', 'serif'],
        sans: ['Inter', 'sans-serif']
      },
      boxShadow: {
        glow: '0 0 30px rgba(212, 175, 55, 0.18)'
      }
    }
  },
  plugins: []
} satisfies Config;
