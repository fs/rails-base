export default function(dir) {
  const req = require.context(dir, true, /\.js$/);

  req.keys().forEach(req);
}
