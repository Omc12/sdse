import mongoose, { Schema, Document } from "mongoose";

export interface IBaseEntity extends Document {
  _id: mongoose.Types.ObjectId;
  createdAt: Date;
  updatedAt: Date;
}

export class BaseEntity {
  _id?: mongoose.Types.ObjectId;
  createdAt?: Date;
  updatedAt?: Date;

  constructor(data?: Partial<IBaseEntity>) {
    if (data) {
      this._id = data._id;
      this.createdAt = data.createdAt;
      this.updatedAt = data.updatedAt;
    }
  }
}

export const baseSchema = new Schema(
  {},
  {
    timestamps: true,
  }
);