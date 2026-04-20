import { ImageResponse } from "next/og";

export const size = {
  width: 512,
  height: 512,
};

export const contentType = "image/png";

export default function Icon() {
  return new ImageResponse(
    (
      <div
        style={{
          width: "100%",
          height: "100%",
          display: "flex",
          alignItems: "center",
          justifyContent: "center",
          position: "relative",
          overflow: "hidden",
          background:
            "linear-gradient(145deg, #060b1b 0%, #10245b 48%, #0ca5b8 100%)",
        }}
      >
        <div
          style={{
            position: "absolute",
            inset: 42,
            borderRadius: "30%",
            border: "6px solid rgba(181, 243, 255, 0.35)",
          }}
        />
        <div
          style={{
            position: "absolute",
            width: 420,
            height: 420,
            borderRadius: "999px",
            background:
              "radial-gradient(circle at 30% 25%, rgba(190, 246, 255, 1) 0%, rgba(62, 120, 209, 0.9) 42%, rgba(7, 15, 48, 1) 100%)",
            boxShadow:
              "0 0 80px rgba(88, 220, 255, 0.6), inset 0 0 44px rgba(255, 255, 255, 0.2)",
          }}
        />
        <div
          style={{
            position: "absolute",
            width: 272,
            height: 272,
            borderRadius: "999px",
            border: "14px solid rgba(220, 250, 255, 0.95)",
            boxShadow:
              "0 0 32px rgba(168, 245, 255, 0.85), inset 0 0 18px rgba(255, 255, 255, 0.45)",
          }}
        />
        <div
          style={{
            position: "absolute",
            width: 260,
            height: 110,
            borderRadius: "999px",
            borderTop: "16px solid rgba(196, 249, 255, 0.95)",
            transform: "rotate(-20deg) translateY(18px)",
            boxShadow: "0 0 25px rgba(176, 247, 255, 0.7)",
          }}
        />
        <div
          style={{
            fontSize: 182,
            fontWeight: 900,
            letterSpacing: "8px",
            color: "#f4fdff",
            textShadow:
              "0 0 22px rgba(199, 250, 255, 0.9), 0 10px 26px rgba(7, 26, 79, 0.9)",
          }}
        >
          ST
        </div>
      </div>
    ),
    size
  );
}
