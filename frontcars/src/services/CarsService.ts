import axios from "axios";
// import { ICard, ICardsApi } from "../store/types";

class CarsService {
  private readonly API_URL = "http://localhost:1111";
  private api = axios.create({
    baseURL: this.API_URL,
  });

  public async getCars(): Promise<any> {
    const { data } = await this.api.get<any>(`/cars`);
    return data;
  }
  public async getCar(id: string): Promise<any> {
    const { data } = await this.api.get<any>(`/cars?vin=${id}`);
    return data;
  }
  public async getBrand(): Promise<any> {
    const { data } = await this.api.get<any>(`/cars/allbrands`);
    return data;
  }

  public async getBrandAndModel(brand: string): Promise<any> {
    const { data } = await this.api.get<any>(`/cars/allbrands/${brand}`);
    return data;
  }
  public async getCarByBrabdAndModel(brand: any, model: any): Promise<any> {
    const { data } = await this.api.get<any>(
      ` /cars?brand=${brand}&model=${model}`
    );
    return data;
  }
}
export const carsApi = new CarsService();
