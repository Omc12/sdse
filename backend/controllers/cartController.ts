import userModel from "../models/userModel.js";
import type { Request, Response } from "express";

// add items to user cart
const addToCart = async (
  req: Request<unknown, unknown, { userId?: string; itemId?: string }>,
  res: Response
) => {
  try {
    const userId = req.body.userId ?? "";
    const itemId = req.body.itemId ?? "";
    if (!userId || !itemId) {
      return res.json({ success: false, message: "Missing userId or itemId" });
    }
    const userData = await userModel.findById(userId);
    if (!userData) {
      return res.json({ success: false, message: "User not found" });
    }
    const cartData = userData.cartData ?? {};
    if (!cartData[itemId]) {
      cartData[itemId] = 1;
    } else {
      cartData[itemId] += 1;
    }
    await userModel.findByIdAndUpdate(userId, { cartData });
    res.json({ success: true, message: "Added to Cart" });
  } catch (error) {
    console.log(error);
    res.json({ success: false, message: "Error" });
  }
};

// remove from cart
const removeFromCart = async (
  req: Request<unknown, unknown, { userId?: string; itemId?: string }>,
  res: Response
) => {
  try {
    const userId = req.body.userId ?? "";
    const itemId = req.body.itemId ?? "";
    if (!userId || !itemId) {
      return res.json({ success: false, message: "Missing userId or itemId" });
    }
    const userData = await userModel.findById(userId);
    if (!userData) {
      return res.json({ success: false, message: "User not found" });
    }
    const cartData = userData.cartData ?? {};
    if (cartData[itemId] > 1) {
      cartData[itemId] -= 1;
    } else {
      delete cartData[itemId];
    }
    await userModel.findByIdAndUpdate(userId, { cartData });
    res.json({ success: true, message: "Removed from Cart" });
  } catch (error) {
    console.log(error);
    res.json({ success: false, message: "Error" });
  }
};

// fetch user cart data
const getCart = async (
  req: Request<unknown, unknown, { userId?: string }>,
  res: Response
) => {
  try {
    let userData = await userModel.findById(req.body.userId);
    let cartData = await userData.cartData;
    res.json({ success: true, cartData: cartData });
  } catch (error) {
    console.log(error);
    res.json({ success: false, message: "Error" });
  }
};

export { addToCart, removeFromCart, getCart };
