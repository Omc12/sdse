import * as mongoose from "mongoose";

export const connectDB = async () => {
  await (mongoose as any)
    .connect(process.env.MONGO_URL ?? "")
    .then(() => console.log("DB Connected"));
};
