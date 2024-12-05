export function calculateAge(dob: string | undefined): number {
  if (!dob) {
    return 0; // Return 0 or a default value if dob is undefined
  }
  const today = new Date();
  const birthDate = new Date(dob);
  let age = today.getFullYear() - birthDate.getFullYear();
  const month = today.getMonth();
  if (month < birthDate.getMonth() || (month === birthDate.getMonth() && today.getDate() < birthDate.getDate())) {
    age--;
  }
  return age;
}

export const baseUrl = 'http://localhost:5001/api'

const totalDuration = 4800;
const delayBetweenPoints = totalDuration / 3;
// @ts-ignore
const previousY = (ctx) => ctx.index === 0 ? ctx.chart.scales.y.getPixelForValue(100) : ctx.chart.getDatasetMeta(ctx.datasetIndex).data[ctx.index - 1]?.getProps(['y'], true).y;
// @ts-ignore
const baseAnimation = {
  x: {
    type: 'color',
    easing: 'easeInOutQuad',
    duration: delayBetweenPoints,
    from: 0, // the point is initially skipped
    // @ts-ignore
    delay(ctx) {
      if (ctx.type !== 'data' || ctx.xStarted) {
        return 0;
      }
      ctx.xStarted = true;
      return ctx.index * delayBetweenPoints;
    }
  },
  y: {
    type: 'number',
    easing: 'easeInOutQuad',
    duration: delayBetweenPoints,
    from: previousY,
    // @ts-ignore
    delay(ctx) {
      if (ctx.type !== 'data' || ctx.yStarted) {
        return 0;
      }
      ctx.yStarted = true;
      return ctx.index * delayBetweenPoints;
    }
  }
};

//@ts-ignore
let delayed;

export const delayAnimation = {

  onComplete: () => {
    delayed = true;
  },
  //@ts-ignore
  delay: (context) => {
    let delay = 0;
    //@ts-ignore
    if (context.type === 'data' && context.mode === 'default' && !delayed) {
      delay = context.dataIndex * 300 + context.datasetIndex * 100;
    }
    return delay;
  },

}

export const baseChartConfig = {
  responsive: true,
  plugins: {
    legend: {
      display: true,
      position: 'top',
    },
    tooltip: {
      enabled: true,
    },
  },
  // @ts-ignore
  animation: delayAnimation,
  scales: {
    x: {
      beginAtZero: true,
    },
    y: {
      // beginAtZero: true,
    },
  },
};

export const baseTension =  0.1;

