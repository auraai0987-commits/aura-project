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
