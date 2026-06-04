export const auraTheme = {
  base: '#080B12',
  surface: '#1A1F2B',
  gold: '#D4AF37',
  teal: '#0D9488',
  offwhite: '#F8FAFC',
  silver: '#94A3B8'
};

export function healthScore(value: number) {
  return Math.max(0, Math.min(100, value));
}
