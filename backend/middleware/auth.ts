import jwt from "jsonwebtoken";
import type { NextFunction, Request, Response } from "express";

const authMiddleware = async (req: Request, res: Response, next: NextFunction) => {
  const token = req.headers["token"];
  if (!token) {
    return res.json({ success: false, message: "Not Authorized Login Again" });
  }
  try {
    const tokenString = Array.isArray(token) ? token[0] : token;
    const token_decode = jwt.verify(tokenString, process.env.JWT_SECRET ?? "") as { id?: string };
    req.body.userId = token_decode.id;
    next();
  } catch (error) {
    console.log(error);
    res.json({success:false,message:"Error"});
  }
};
export default authMiddleware;
