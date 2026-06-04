#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="/workspaces/aura-project"
cd "$REPO_DIR"

echo "[AURA v2] Resetting workspace"
rm -rf apps packages .next .expo node_modules package-lock.json
mkdir -p apps/web/app/dashboard apps/web/app/pricing apps/web/components apps/web/lib apps/mobile/app apps/mobile/components packages/core/src packages/ui/src packages/api/src

cat > package.json <<'EOF'
{
  "name": "aura-v2-monorepo",
  "private": true,
  "workspaces": ["apps/*", "packages/*"],
  "scripts": {
    "dev:web": "npm --prefix apps/web run dev",
    "dev:mobile": "npm --prefix apps/mobile run start",
    "build:web": "npm --prefix apps/web run build",
    "install:all": "npm install"
  },
  "packageManager": "npm@11.9.0"
}
EOF

cat > tsconfig.base.json <<'EOF'
{
  "compilerOptions": {
    "target": "es2020",
    "lib": ["dom", "dom.iterable", "es2020"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve"
  }
}
EOF

cat > apps/web/package.json <<'EOF'
{
  "name": "@aura/web",
  "private": true,
  "scripts": {
    "dev": "next dev -p 3000",
    "build": "next build",
    "start": "next start -p 3000"
  },
  "dependencies": {
    "@aura/core": "*",
    "@aura/ui": "*",
    "@aura/api": "*",
    "cmdk": "^1.1.1",
    "framer-motion": "^11.11.9",
    "next": "14.2.15",
    "next-themes": "^0.4.1",
    "papaparse": "^5.4.1",
    "react": "18.3.1",
    "react-dom": "18.3.1",
    "recharts": "^2.9.0",
    "sonner": "^1.7.0",
    "tailwindcss": "^3.4.14"
  },
  "devDependencies": {
    "@types/node": "^20.16.11",
    "@types/react": "^18.3.12",
    "@types/react-dom": "^18.3.0",
    "autoprefixer": "^10.4.20",
    "postcss": "^8.4.49",
    "typescript": "^5.6.3"
  }
}
EOF

cat > apps/web/tsconfig.json <<'EOF'
{
  "extends": "../../tsconfig.base.json",
  "compilerOptions": {
    "paths": {
      "@/*": ["./*"]
    },
    "plugins": [{ "name": "next" }]
  },
  "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx", ".next/types/**/*.ts"]
}
EOF

cat > apps/web/next-env.d.ts <<'EOF'
/// <reference types="next" />
/// <reference types="next/image-types/global" />
EOF

cat > apps/web/next.config.js <<'EOF'
/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  experimental: {
    optimizePackageImports: ['framer-motion', 'recharts']
  }
};

module.exports = nextConfig;
EOF

cat > apps/web/postcss.config.js <<'EOF'
module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {}
  }
};
EOF

cat > apps/web/tailwind.config.ts <<'EOF'
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
EOF

cat > apps/web/app/globals.css <<'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

:root { color-scheme: dark; }
html, body { background: linear-gradient(135deg, #080B12, #111827); color: #F8FAFC; font-family: Inter, sans-serif; }
* { box-sizing: border-box; }

.glass { background: rgba(26,31,43,0.72); border: 1px solid rgba(148,163,184,0.18); box-shadow: 0 18px 40px rgba(8,11,18,0.35); backdrop-filter: blur(18px); }
EOF

cat > apps/web/app/layout.tsx <<'EOF'
import './globals.css';
import type { Metadata } from 'next';

export const metadata: Metadata = {
  title: 'AURA v2',
  description: 'AI business intelligence monorepo'
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
EOF

cat > apps/web/app/page.tsx <<'EOF'
import { motion } from 'framer-motion';

export default function Home() {
  return (
    <main className="min-h-screen px-6 py-10 text-offwhite">
      <nav className="glass sticky top-4 z-20 mx-auto flex max-w-7xl items-center justify-between rounded-2xl px-6 py-4">
        <div className="text-2xl font-semibold text-gold">AURA</div>
        <div className="flex gap-4 text-sm text-silver">Landing • Dashboard • Pricing</div>
      </nav>
      <section className="mx-auto grid max-w-7xl gap-10 py-16 lg:grid-cols-[1.1fr_0.9fr]">
        <motion.div initial={{ opacity: 0, y: 18 }} animate={{ opacity: 1, y: 0 }} className="space-y-8">
          <p className="rounded-full border border-gold/40 bg-gold/10 px-4 py-2 text-sm text-gold">AURA v2 • unified AI intelligence</p>
          <h1 className="max-w-xl font-display text-5xl leading-tight md:text-6xl">Turn your next quarter into a confident forecast.</h1>
          <p className="max-w-xl text-lg text-silver">A cinematic, glassy, AI-first operating system for founders, advisors, enterprises and researchers.</p>
          <div className="flex gap-4">
            <a href="/dashboard" className="rounded-xl bg-gold px-5 py-3 font-semibold text-navy">See AURA in Action</a>
            <a href="/pricing" className="rounded-xl border border-silver/30 px-5 py-3 text-offwhite">Explore plans</a>
          </div>
          <div className="grid gap-4 sm:grid-cols-3">{["12M+ models", "97% signal accuracy", "24/7 guardian"].map((v) => <div key={v} className="glass rounded-2xl p-4 text-center text-sm text-silver">{v}</div>)}</div>
        </motion.div>
        <motion.div initial={{ opacity: 0, scale: 0.98 }} animate={{ opacity: 1, scale: 1 }} className="glass rounded-3xl p-6">
          <div className="rounded-2xl border border-gold/30 bg-gradient-to-br from-surface to-navy p-6 shadow-glow">
            <p className="text-sm text-gold">Live AI overview</p>
            <h2 className="mt-2 text-3xl font-semibold">Revenue confidence: 91%</h2>
            <p className="mt-3 text-silver">Projected margin expansion, risk watch, and investor-quality guidance in one studio.</p>
          </div>
          <div className="mt-6 grid gap-4">{['AI forecasting', 'Risk simulation', 'Launchpad confidence'].map((item) => <div key={item} className="rounded-2xl border border-silver/15 bg-black/20 p-4 text-sm text-offwhite">{item}</div>)}</div>
        </motion.div>
      </section>
    </main>
  );
}
EOF

cat > apps/web/app/dashboard/page.tsx <<'EOF'
import { motion } from 'framer-motion';

export default function Dashboard() {
  return (
    <main className="min-h-screen bg-[radial-gradient(circle_at_top,_#111827,_#080B12_45%)] p-8 text-offwhite">
      <div className="mx-auto flex max-w-7xl gap-6">
        <aside className="glass w-72 rounded-3xl p-6">AURA • Pro</aside>
        <section className="flex-1 space-y-6">
          <motion.div initial={{ opacity: 0, y: 12 }} animate={{ opacity: 1, y: 0 }} className="glass rounded-3xl p-6">
            <p className="text-sm text-gold">Welcome back</p>
            <h1 className="mt-2 text-3xl font-semibold">Acme Labs</h1>
            <p className="text-silver">Health Score 92 • Streak 8 days • Badges 3</p>
          </motion.div>
          <div className="grid gap-6 md:grid-cols-2 xl:grid-cols-4">{[['Streak', '8 days'], ['Badges', '3'], ['Analyses', '11'], ['Goal Progress', '74%']].map(([label, value]) => <div key={label} className="glass rounded-3xl p-5"><p className="text-silver">{label}</p><p className="mt-2 text-3xl font-semibold">{value}</p></div>)}</div>
        </section>
      </div>
    </main>
  );
}
EOF

cat > apps/web/app/pricing/page.tsx <<'EOF'
export default function Pricing() {
  return (
    <main className="min-h-screen px-6 py-10 text-offwhite">
      <div className="mx-auto max-w-7xl space-y-8">
        <h1 className="font-display text-4xl">Plans & pricing</h1>
        <p className="max-w-2xl text-silver">Starter (7-day trial), Lite (free), Pro ($79/mo), Enterprise ($299/mo), Enterprise+ ($2,499/mo).</p>
        <div className="grid gap-6 md:grid-cols-2 xl:grid-cols-5">{[
          ['Starter', '$0', '5 analyses'], ['Lite', 'Free', '1/month'], ['Pro', '$79', 'Unlimited'], ['Enterprise', '$299', 'Advanced'], ['Enterprise+', '$2,499', 'White-glove']
        ].map(([name, price, detail]) => <article key={name} className="glass rounded-3xl p-6"><h2 className="text-xl font-semibold">{name}</h2><p className="mt-2 text-silver">{detail}</p><p className="mt-4 text-3xl font-bold text-gold">{price}</p></article>)}</div>
      </div>
    </main>
  );
}
EOF

cat > packages/core/package.json <<'EOF'
{
  "name": "@aura/core",
  "version": "1.0.0",
  "main": "src/index.ts",
  "types": "src/index.ts",
  "private": true
}
EOF

cat > packages/core/src/index.ts <<'EOF'
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
EOF

cat > packages/ui/package.json <<'EOF'
{
  "name": "@aura/ui",
  "version": "1.0.0",
  "main": "src/index.ts",
  "types": "src/index.ts",
  "private": true
}
EOF

cat > packages/ui/src/index.ts <<'EOF'
export function Surface({ children }: { children: React.ReactNode }) {
  return <section className="rounded-3xl border border-white/10 bg-white/5 p-6 shadow-xl">{children}</section>;
}
EOF

cat > packages/api/package.json <<'EOF'
{
  "name": "@aura/api",
  "version": "1.0.0",
  "main": "src/index.ts",
  "types": "src/index.ts",
  "private": true
}
EOF

cat > packages/api/src/index.ts <<'EOF'
export function aiSummary(input: string) {
  return `AURA analysis ready: ${input}`;
}
EOF

cat > apps/mobile/package.json <<'EOF'
{
  "name": "@aura/mobile",
  "private": true,
  "main": "expo-router/entry",
  "scripts": {
    "start": "expo start --clear",
    "android": "expo start --android",
    "ios": "expo start --ios",
    "web": "expo start --web"
  },
  "dependencies": {
    "expo": "~56.0.8",
    "expo-router": "~56.2.8",
    "react": "18.3.1",
    "react-native": "0.76.1",
    "react-native-safe-area-context": "5.4.0",
    "react-native-screens": "^4.25.2",
    "@react-navigation/native": "^7.2.5",
    "@react-native-async-storage/async-storage": "^1.7.0",
    "bcryptjs": "^2.4.0",
    "jsonwebtoken": "^9.0.1",
    "nativewind": "^4.0.0",
    "react-native-svg": "^15.0.0"
  },
  "devDependencies": {
    "typescript": "^5.6.3",
    "@types/react": "^18.3.12"
  }
}
EOF

cat > apps/mobile/tsconfig.json <<'EOF'
{
  "extends": "../../tsconfig.base.json",
  "compilerOptions": {
    "jsx": "react-jsx",
    "paths": {
      "@/*": ["./*"]
    }
  },
  "include": ["**/*.ts", "**/*.tsx"]
}
EOF

cat > apps/mobile/app/_layout.tsx <<'EOF'
import { Stack } from 'expo-router';

export default function Layout() {
  return <Stack screenOptions={{ headerShown: false }} />;
}
EOF

cat > apps/mobile/app/index.tsx <<'EOF'
import { Text, View } from 'react-native';

export default function MobileHome() {
  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center', backgroundColor: '#080B12' }}>
      <Text style={{ color: '#D4AF37', fontSize: 28, fontWeight: '700' }}>AURA Mobile</Text>
      <Text style={{ color: '#F8FAFC', marginTop: 8 }}>Expo shell for AURA v2</Text>
    </View>
  );
}
EOF

cat > apps/mobile/babel.config.js <<'EOF'
module.exports = function (api) {
  api.cache(true);
  return {
    presets: ['babel-preset-expo']
  };
};
EOF

cat > README.md <<'EOF'
# AURA v2

Monorepo scaffold generated by master-aura-v2.sh with:
- apps/web: Next.js 14 App Router
- apps/mobile: Expo React Native
- packages/core, packages/ui, packages/api
EOF

chmod +x master-aura-v2.sh

echo "[AURA v2] Installing dependencies"
npm install --legacy-peer-deps

echo "[AURA v2] Git setup"
git add .
if ! git diff --cached --quiet; then
  git commit -m "chore: scaffold AURA v2 monorepo" || true
fi

git push origin HEAD || true

echo "[AURA v2] Starting web dev server on port 3000"
(npm --prefix apps/web run dev > /tmp/aura-web.log 2>&1 &)

echo "[AURA v2] Starting mobile Expo server"
(npm --prefix apps/mobile run start > /tmp/aura-mobile.log 2>&1 &)

echo "[AURA v2] Done. Web logs: /tmp/aura-web.log"
echo "[AURA v2] Done. Mobile logs: /tmp/aura-mobile.log"
