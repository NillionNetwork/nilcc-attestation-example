import Image from "next/image";

export default function Home() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      <div>
        <h1 className="mb-2"> Badge Demo (Correct)</h1>
        <iframe
          src="https://nilcc.nillion.com/api/badge?verificationUrl=https%3A%2F%2Fgithub.com%2FNillionNetwork%2Fnilcc-attestation-example%2Fblob%2Fmain%2Fverification-manifest.json&reportUrl=https%3A%2F%2F36cd5019-e53b-4788-9a76-4775343fedeb.workloads.nilcc.sandbox.nillion.network%2Fnilcc%2Fapi%2Fv2%2Freport"
          width={260}
          height={90}
          style={{ border: 'none' }}
        />
        <h1 className="mb-2"> Badge Demo (Incorrect)</h1>
        <iframe
          src="http://localhost:3001/api/badge?verificationUrl=https%3A%2F%2Fgithub.com%2FNillionNetwork%2Fnilcc-attestation-example%2Fblob%2Fmain%2Fverification-manifest.json&reportUrl=https%3A%2F%2F36cd5019-e53b-4788-9a76-4775343fedeb.workloads.nilcc.sandbox.nillion.network%2Fnilcc%2Fapi%2Fv2%2Freport"
          width={260}
          height={90}
          style={{ border: 'none' }}
        />
      </div>
    </main>
  );
}
