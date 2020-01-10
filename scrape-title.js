const puppeteer = require('puppeteer');

// (async () => {
//   const browser = await puppeteer.launch();
//   const page = await browser.newPage();
//   await page.goto('https://www.google.com');
//   await page.screenshot({path: 'screenshot.png'});

//   await browser.close();
// })();

// const fs = require('fs');
// let text = fs.readFileSync("./sitemap-parsed.txt", 'utf-8');
// console.log(text);
// console.log(typeof text);

const lineReader = require('line-reader');

let limit = 0;
lineReader.eachLine('./sitemap-parsed.txt', function(line) {
  regex = RegExp('cost/tax-accountant/');
  if (regex.test(line)) {
    (async () => {
      const browser = await puppeteer.launch();
      const page = await browser.newPage();
      await page.goto(line);
      await page.waitFor(1000)
      let title = await page.title();


      await browser.close();
      console.log(line);
      console.log(title);
    })();
  }

});