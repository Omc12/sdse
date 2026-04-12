import type { Request } from "express";
import type { HydratedDocument } from "mongoose";

export interface IUser {
  name: string;
  email: string;
  password: string;
  role: string;
  cartData: Record<string, unknown>;
}

export interface IFoodItem {
  name: string;
  description: string;
  price: number;
  category: string;
  image: string;
}

export interface IOrderItem {
  foodId: string;
  quantity: number;
  price: number;
}

export type IOrder = HydratedDocument<{
  userId: string;
  items: IOrderItem[];
  totalPrice: number;
  status: string;
  createdAt?: Date;
  updatedAt?: Date;
}>;

export interface IUserDocument extends IUser, HydratedDocument<IUser> {}

export interface MulterRequest extends Request {
  file?: Express.Multer.File;
  body: Record<string, unknown>;
}
