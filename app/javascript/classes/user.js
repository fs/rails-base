export default class User {
  constructor(data) {
    this.data = data;
  }

  get(param) {
    return this.data[param];
  }
}
