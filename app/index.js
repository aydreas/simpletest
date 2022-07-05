const express = require('express')
const dotenv = require('dotenv')
dotenv.config()
const app = express()
const port = process.env.PORT || 3000

app.get('/', (req, res) => {
    res.json({ hello: 'world2' })
})

app.listen(port,() =>{
    console.log('server started on port ' + port)
})