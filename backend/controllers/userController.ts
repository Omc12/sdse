import userModel from "../models/userModel.js";
import jwt from "jsonwebtoken";
import bcrypt from "bcrypt";
import validator from "validator";
import type { Request, Response } from "express";

// login user

const loginUser = async (
  req: Request<unknown, unknown, { email?: string; password?: string }>,
  res: Response
) => {
  const email = req.body.email ?? "";
  const password = req.body.password ?? "";
  try {
    const user = await userModel.findOne({ email });
    if (!user) {
      return res.json({ success: false, message: "User Doesn't exist" });
    }
    const isMatch =await bcrypt.compare(password, user.password);
    if (!isMatch) {
      return res.json({ success: false, message: "Invalid Credentials" });
    }
    const role=user.role;
    const token = createToken(user._id);
    res.json({ success: true, token,role });
  } catch (error) {
    console.log(error);
    res.json({ success: false, message: "Error" });
  }
};

// Create token

const createToken = (id: string) => {
  return jwt.sign({ id }, process.env.JWT_SECRET ?? "");
};

// register user

const registerUser = async (
  req: Request<unknown, unknown, { name?: string; email?: string; password?: string }>,
  res: Response
) => {
  const name = req.body.name ?? "";
  const email = req.body.email ?? "";
  const password = req.body.password ?? "";
  try {
    // checking user is already exist
    const exists = await userModel.findOne({ email });
    if (exists) {
      return res.json({ success: false, message: "User already exists" });
    }

    // validating email format and strong password
    if (!validator.isEmail(email)) {
      return res.json({ success: false, message: "Please enter valid email" });
    }
    if (password.length < 8) {
      return res.json({
        success: false,
        message: "Please enter strong password",
      });
    }

    // hashing user password

    const salt = await bcrypt.genSalt(Number(process.env.SALT ?? "10"));
    const hashedPassword = await bcrypt.hash(password, salt);

    const newUser = new userModel({
      name,
      email,
      password: hashedPassword,
    });

    const user = await newUser.save();
    const role=user.role;
    const token = createToken(user._id);
    res.json({ success: true, token, role});
  } catch (error) {
    console.log(error);
    res.json({ success: false, message: "Error" });
  }
};

export { loginUser, registerUser };
