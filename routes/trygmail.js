const nodemailer = require('nodemailer');
const transporter = nodemailer.createTransport({
  host: 'smtp.gmail.com',
  port: 465,
  auth: {
    user: '輸入 Email',
    pass: '輸入從 Gmail 連線設定所取得的密碼',
  },
});

transporter.sendMail({
  from: '輸入自己的 Email',
  to: '輸入要寄給誰的 Email',
  subject: '輸入信件主旨',
  html: '輸入信件內容',
}).then(info => {
  console.log({ info });
}).catch(console.error);