const db = require('../modules/connect_db');

(async ()=>{
    const [results,fields] = await db.query("SELECT * FROM produst LIMIT 5");
    console.log(results);
    // console.log(fields);
    process.exit(); // 結束行程
})();