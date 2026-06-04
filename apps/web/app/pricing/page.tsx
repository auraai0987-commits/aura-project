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
