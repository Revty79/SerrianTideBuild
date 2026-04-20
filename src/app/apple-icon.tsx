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
            "linear-gradient(160deg, #050b1c 0%, #0d1f4d 45%, #0a92bd 100%)",
        }}
      >
        <div
          style={{
            position: "absolute",
            top: 24,
            left: 26,
            width: 40,
            height: 40,
            borderRadius: "999px",
            background: "rgba(196, 247, 255, 0.95)",
          }}
        />
        <div
          style={{
            position: "absolute",
            top: 28,
            left: 34,
            width: 33,
            height: 33,
            borderRadius: "999px",
            background: "#0b1e4d",
          }}
        />
        <div
          style={{
            position: "absolute",
            width: 148,
            height: 148,
            borderRadius: "999px",
            background:
              "radial-gradient(circle at 30% 25%, rgba(176, 236, 255, 0.98) 0%, rgba(58, 113, 202, 0.9) 45%, rgba(8, 16, 51, 1) 100%)",
            boxShadow:
              "0 0 28px rgba(88, 220, 255, 0.6), inset 0 0 24px rgba(255, 255, 255, 0.2)",
          }}
        />
        <div
          style={{
            position: "absolute",
            bottom: 30,
            width: 136,
            height: 52,
            borderRadius: "50%",
            borderTop: "8px solid rgba(195, 247, 255, 0.92)",
            transform: "rotate(-8deg)",
            boxShadow:
              "0 0 12px rgba(163, 243, 255, 0.62), inset 0 0 8px rgba(255, 255, 255, 0.3)",
          }}
        />
        <div
          style={{
            position: "absolute",
            bottom: 22,
            width: 116,
            height: 40,
            borderRadius: "50%",
            borderTop: "6px solid rgba(224, 252, 255, 0.95)",
            transform: "rotate(-8deg)",
          }}
        />
        <div
          style={{
            position: "absolute",
            right: 30,
            top: 34,
            width: 4,
            height: 4,
            borderRadius: "999px",
            background: "rgba(230, 252, 255, 0.95)",
          }}
        />
        <div
          style={{
            position: "absolute",
            right: 44,
            top: 48,
            width: 3,
            height: 3,
            borderRadius: "999px",
            background: "rgba(221, 250, 255, 0.9)",
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
