(async () => {
  //await loadConfettiPreset(tsParticles);

  await tsParticles.load("tsparticles", {
    particles: {
      shape: {
        character: {
          fill: false,
          font: "Verdana",
          style: "",
          value: "*",
          weight: "400"
        },
        image: [
          {
            src: "R.png",
            width: 320,
            height: 320
          },
          {
            src: "Python.png",
            width: 320,
            height: 320
          },
          {
            src: "Quarto.png",
            width: 320,
            height: 320
          },
          {
            src: "Positron.png",
            width: 320,
            height: 320
          },
          {
            src: "github.png",
            width: 320,
            height: 320
          },
          {
            src: "VScode.png",
            width: 320,
            height: 320
          },
          {
            src: "Claude.svg",
            width: 320,
            height: 320
          },
          {
            src: "OpenAI.png",
            width: 320,
            height: 320
          },
          {
            src: "Gemini.png",
            width: 320,
            height: 320
          },
          {
            src: "mcp-logo.svg",
            width: 320,
            height: 320
          }
        ],
        polygon: {
          nb_sides: 5
        },
        stroke: {
          color: "#000000",
          width: 0
        },
        type: "image"
      },
      life: {
        duration: {
          value: 0
        }
      },
      number: {
        value: 25,
        max: 0,
        density: {
          enable: true
        }
      },
      move: {
        enable: true,
        gravity: {
          enable: false
        },
        decay: 0,
        direction: "bottom",
        speed: 2,
        outModes: {
          default: "out",
          left: "out",
          right: "out",
          bottom: "out",
          top: "out"
        }
      },
      size: {
        value: 50
      },
      opacity: {
        value: 1,
        animation: {
          enable: false
        }
      }
    },
    background: {
      color: "#232323",
      opacity: 0
    },
    emitters: [],
    interactivity: {
      events: {
        onClick: {
          enable: true,
          mode: "repulse"
        }
      }
    },
    preset: "confetti"
  });
})();
