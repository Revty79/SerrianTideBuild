import { ImageResponse } from "next/og";

export const size = {
  width: 180,
  height: 180,
};

export const contentType = "image/png";

export default function AppleIcon() {
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
            "linear-gradient(150deg, #070b1d 0%, #0e2155 45%, #0da6b8 100%)",
        }}
      >
        <div
          style={{
            position: "absolute",
            width: 148,
            height: 148,
            borderRadius: "999px",
            background:
              "radial-gradient(circle at 30% 25%, rgba(188, 245, 255, 1) 0%, rgba(61, 118, 207, 0.92) 45%, rgba(8, 16, 51, 1) 100%)",
            boxShadow:
              "0 0 28px rgba(88, 220, 255, 0.6), inset 0 0 22px rgba(255, 255, 255, 0.2)",
          }}
        />
        <div
          style={{
            position: "absolute",
            width: 102,
            height: 102,
            borderRadius: "999px",
            border: "8px solid rgba(221, 250, 255, 0.95)",
            boxShadow:
              "0 0 16px rgba(167, 246, 255, 0.8), inset 0 0 10px rgba(255, 255, 255, 0.45)",
          }}
        />
        <div
          style={{
            fontSize: 68,
            fontWeight: 900,
            letterSpacing: "3px",
            color: "#f4fdff",
            textShadow:
              "0 0 10px rgba(199, 250, 255, 0.9), 0 4px 12px rgba(7, 26, 79, 0.9)",
          }}
        >
          ST
        </div>
      </div>
    ),
    size
  );
}
