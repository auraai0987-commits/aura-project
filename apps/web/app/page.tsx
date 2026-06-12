 export default function Home() {
  return (
    <main className="min-h-screen bg-white text-gray-900">
      {/* Header */}
      <header className="bg-[#1e3a8a] text-white px-6 py-4 flex justify-between items-center">
        <div className="flex items-center gap-2">
          <span className="font-bold text-lg">A</span>
          <div>
            <div className="font-bold">AURA</div>
            <div className="text-xs opacity-80">BUSINESS INTELLIGENCE</div>
          </div>
        </div>
        <nav className="hidden md:flex gap-6 text-sm">
          <a href="#">Solutions</a>
          <a href="#">Data Room</a>
          <a href="#">Insights</a>
          <a href="#">Resources</a>
          <a href="#">Contact</a>
        </nav>
        <div className="flex gap-3">
          <button className="bg-white text-[#1e3a8a] px-4 py-1.5 rounded-full text-sm">Request access</button>
          <button className="text-sm">Login</button>
        </div>
      </header>

      {/* Hero */}
      <section className="px-6 py-16 md:py-24 max-w-6xl mx-auto grid md:grid-cols-2 gap-12 items-center">
        <div>
          <h1 className="text-4xl md:text-5xl font-bold leading-tight">
            Aura Technologies — Self-Building AI Infrastructure
          </h1>
          <p className="mt-4 text-lg text-gray-600">
            Meet Elsie and Aura-1. The autonomous engine that builds, maintains, and repairs itself so your company never stops evolving.
          </p>
          <div className="mt-6 flex gap-4">
            <button className="bg-[#1e3a8a] text-white px-6 py-3 rounded-md font-medium">See Aura-1 in Action</button>
            <button className="border border-[#1e3a8a] text-[#1e3a8a] px-6 py-3 rounded-md font-medium">Partner With Us</button>
          </div>
        </div>
        <div className="space-y-4">
          <div className="border rounded-lg p-4">
            <div className="text-sm text-gray-500">Forecast Performance</div>
            <div className="text-2xl font-bold">$1.32M</div>
          </div>
          <div className="border rounded-lg p-4">
            <div className="text-sm text-gray-500">Growth Velocity</div>
            <div className="text-2xl font-bold text-green-600">+24%</div>
          </div>
          <div className="border rounded-lg p-4">
            <div className="text-sm text-gray-500">Confidence Score</div>
            <div className="text-2xl font-bold">92%</div>
          </div>
        </div>
      </section>

      {/* Features */}
      <section className="px-6 py-16 bg-gray-50">
        <div className="max-w-6xl mx-auto grid md:grid-cols-2 gap-8">
          <div>
            <h3 className="font-bold text-lg">Autonomous Build Pipeline</h3>
            <p className="text-gray-600 mt-2">Code written, tested, and deployed by Aura-1 without human bottlenecks.</p>
          </div>
          <div>
            <h3 className="font-bold text-lg">Self-Healing Systems</h3>
            <p className="text-gray-600 mt-2">Failures detected and patched automatically by the Repair Agent.</p>
          </div>
          <div>
            <h3 className="font-bold text-lg">Continuous Evolution</h3>
            <p className="text-gray-600 mt-2">The engine gets better at building itself every day.</p>
          </div>
          <div>
            <h3 className="font-bold text-lg">Human-in-the-Loop</h3>
            <p className="text-gray-600 mt-2">You set the destination. Elsie charts the path.</p>
          </div>
        </div>
      </section>

      {/* Pricing */}
      <section className="px-6 py-16 max-w-6xl mx-auto">
        <h2 className="text-3xl font-bold text-center mb-12">Pricing</h2>
        <div className="grid md:grid-cols-4 gap-6">
          {[
            {name: "Free", price: "$0", features: ["Basic access", "Community support"]},
[6/12/2026 1:24 PM] Jean Bean: {name: "Starter", price: "$79/mo", features: ["Full API access", "Email support"]},
            {name: "Enterprise", price: "$299/mo", features: ["Custom integrations", "Priority support"]},
            {name: "Enterprise+", price: "$2499/mo", features: ["Dedicated Aura-1 workers", "SLA guarantee"]},
          ].map((plan) => (
            <div key={plan.name} className="border rounded-lg p-6">
              <h3 className="font-bold">{plan.name}</h3>
              <div className="text-2xl font-bold mt-2">{plan.price}</div>
              <ul className="mt-4 space-y-2 text-sm text-gray-600">
                {plan.features.map(f => <li key={f}>• {f}</li>)}
              </ul>
              <button className="mt-6 w-full bg-[#1e3a8a] text-white py-2 rounded-md">Get Started</button>
            </div>
          ))}
        </div>
      </section>

      {/* Footer */}
      <footer className="bg-[#1e3a8a] text-white px-6 py-12">
        <div className="max-w-6xl mx-auto grid md:grid-cols-3 gap-8">
          <div>
            <div className="font-bold">AURA</div>
            <p className="text-sm mt-2 opacity-80">
              Trusted intelligence for growth, finance, and strategy teams. Built by Aura-1, maintained by Aura-1.
            </p>
          </div>
          <div>
            <div className="font-bold text-sm mb-2">EXPLORE</div>
            <ul className="space-y-1 text-sm opacity-80">
              <li><a href="#">About</a></li>
              <li><a href="#">Solutions</a></li>
              <li><a href="#">Data Room</a></li>
              <li><a href="#">Insights</a></li>
            </ul>
          </div>
          <div>
            <div className="font-bold text-sm mb-2">LEGAL</div>
            <ul className="space-y-1 text-sm opacity-80">
              <li><a href="#">Privacy</a></li>
              <li><a href="#">Terms</a></li>
              <li><a href="#">Cookies</a></li>
              <li><a href="#">Contact</a></li>
            </ul>
          </div>
        </div>
        <div className="text-center text-sm mt-8 opacity-60">
          © 2025 Aura Technologies. All rights reserved.
        </div>
      </footer>
    </main>
  )
}
