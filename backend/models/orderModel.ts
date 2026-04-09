import mongoose from "mongoose";
import { IOrder } from "../types.js";
import { baseSchema } from "./baseModel.js";

const orderSchema = new mongoose.Schema({
  userId: { type: String, required: true },
  items: { type: Array, required: true },
  amount: { type: Number, required: true },
  address: { type: Object, required: true },
  status: { type: String, default: "Food Processing" },
  date: { type: Date, default: Date.now() },
  payment: { type: Boolean, default: false },
});

// Extend base schema for timestamps
orderSchema.add(baseSchema);

const orderModel = mongoose.models.order || mongoose.model<IOrder>("order", orderSchema);

export default orderModel;
