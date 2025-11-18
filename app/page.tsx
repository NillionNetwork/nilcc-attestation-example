import Image from "next/image";

export default function Home() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      <div>
        <h1> hello demo </h1>
        <iframe
          src="https://nilcc.nillion.com/api/badge?verificationUrl=https%3A%2F%2Fgithub.com%2FNillionNetwork%2Fnilcc-attestation-example%2Fblob%2Fmain%2Fverification-manifest.json&reportUrl=https%3A%2F%2F74850b5b-33e2-493b-982e-43aaad9df1bb.workloads.nilcc.sandbox.nillion.network%2Fnilcc%2Fapi%2Fv2%2Freport"
  width={260}
  height={90}
  style={{ border: 'none' }}
/>
      </div>
    </main>
  );
}
