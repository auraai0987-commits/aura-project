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
