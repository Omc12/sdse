import mongoose from "mongoose";
import { IUserDocument } from "../types.js";
import { baseSchema } from "./baseModel.js";

const userSchema = new mongoose.Schema(
  {
    name: { type: String, required: true },
    email: { type: String, required: true, unique: true },
    password: { type: String, required: true },
    role: { type: String, default:"user" },
    cartData: { type: Object, default: {} },
  },
  { minimize: false }
);

// Extend base schema for timestamps
userSchema.add(baseSchema);

const userModel = mongoose.models.user || mongoose.model<IUserDocument>("user", userSchema);
export default userModel;
