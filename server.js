const jsonServer = require('json-server')
const server = jsonServer.create()
const router = jsonServer.router('./data/db.json')
const middlewares = jsonServer.defaults()
const shell = require('shelljs')

function backup() {
  shell.exec('./backup.sh')
}

server.use(middlewares)
router.render = (req, res) => {
  res.jsonp(res.locals.data)
  if (req.method == 'POST' || req.method == 'PUT') {
    backup()
  }
}
server.use(router)
server.listen(3000, () => {
    console.log('JSON Server is running')
  }
)
