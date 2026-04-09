import mongoose from "mongoose";
import { IFoodItem } from "../types.js";
import { baseSchema } from "./baseModel.js";

const foodSchema = new mongoose.Schema({
  name: { type: String, required: true },
  description: { type: String, required: true },
  price: { type: Number, required: true },
  image: { type: String, required: true },
  category: { type: String, required: true },
});

// Extend base schema for timestamps
foodSchema.add(baseSchema);

const foodModel = mongoose.models.food || mongoose.model<IFoodItem>("food", foodSchema);

export default foodModel;
