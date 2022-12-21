import axios from "axios";

export default class UserService {
  static readonly API_URL = "http://localhost:1111";
  static api = axios.create({
    baseURL: this.API_URL,
  });

  static loginUser = async ({
    email,
    password,
  }: {
    email: string;
    password: string;
  }) => {
    try {
      const data = await this.api.post("/login", { email, password });

      if (data.status === 200) {
        return { email, password };
      }

      return null;
    } catch (e) {
      console.log(e);

      return null;
    }
  };

  static registerUser = async ({
    surname,
    name,
    email,
    password,
  }: {
    name: string;
    surname: string;
    email: string;
    password: string;
  }) => {
    try {
      const res = await this.api.post("/signup", {
        email,
        name,
        surname,
        password,
      });

      if (res.status === 200) {
        return {
          email,
          password,
        };
      }

      return null;
    } catch (e) {
      console.log(e);

      return null;
    }
  };
}
