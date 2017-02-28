const QuickApi = require('quick-api');
const server = new QuickApi(__dirname + "/data", 3000);

server.start()
    .then(() => server.log.info('Well hello there world!'));
