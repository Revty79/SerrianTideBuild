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
            "linear-gradient(160deg, #050a1a 0%, #0d1d4b 45%, #0a8fbc 100%)",
        }}
      >
        <div
          style={{
            position: "absolute",
            inset: -70,
            background:
              "radial-gradient(circle at 78% 20%, rgba(171, 236, 255, 0.42) 0%, rgba(171, 236, 255, 0) 44%)",
          }}
        />
        <div
          style={{
            position: "absolute",
            top: 68,
            left: 82,
            width: 124,
            height: 124,
            borderRadius: "999px",
            background: "rgba(196, 247, 255, 0.95)",
          }}
        />
        <div
          style={{
            position: "absolute",
            top: 82,
            left: 106,
            width: 102,
            height: 102,
            borderRadius: "999px",
            background: "#0b1e4d",
          }}
        />
        <div
          style={{
            position: "absolute",
            width: 424,
            height: 424,
            borderRadius: "999px",
            background:
              "radial-gradient(circle at 30% 25%, rgba(170, 233, 255, 0.96) 0%, rgba(56, 105, 196, 0.88) 42%, rgba(7, 16, 51, 1) 100%)",
            boxShadow:
              "0 0 85px rgba(84, 214, 255, 0.6), inset 0 0 44px rgba(255, 255, 255, 0.2)",
          }}
        />
        <div
          style={{
            position: "absolute",
            bottom: 104,
            width: 388,
            height: 150,
            borderRadius: "50%",
            borderTop: "18px solid rgba(188, 244, 255, 0.9)",
            transform: "rotate(-8deg)",
            boxShadow:
              "0 0 24px rgba(158, 239, 255, 0.58), inset 0 0 18px rgba(255, 255, 255, 0.3)",
          }}
        />
        <div
          style={{
            position: "absolute",
            bottom: 80,
            width: 326,
            height: 112,
            borderRadius: "50%",
            borderTop: "12px solid rgba(223, 252, 255, 0.95)",
            transform: "rotate(-7deg)",
            boxShadow: "0 0 20px rgba(177, 248, 255, 0.72)",
          }}
        />
        <div
          style={{
            position: "absolute",
            right: 84,
            top: 98,
            width: 10,
            height: 10,
            borderRadius: "999px",
            background: "rgba(234, 252, 255, 0.95)",
          }}
        />
        <div
          style={{
            position: "absolute",
            right: 116,
            top: 134,
            width: 7,
            height: 7,
            borderRadius: "999px",
            background: "rgba(221, 250, 255, 0.9)",
          }}
        />
        <div
          style={{
            position: "absolute",
            right: 72,
            top: 160,
            width: 5,
            height: 5,
            borderRadius: "999px",
            background: "rgba(221, 250, 255, 0.75)",
          }}
        />
        <div
          style={{
            fontSize: 178,
            fontWeight: 900,
            letterSpacing: "7px",
            color: "#f4fdff",
            textShadow:
              "0 0 22px rgba(199, 250, 255, 0.92), 0 10px 26px rgba(7, 26, 79, 0.9)",
          }}
        >
          ST
        </div>
      </div>
    ),
    size
  );
}
