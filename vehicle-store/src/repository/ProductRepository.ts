import { Client } from "pg";
import Product from "../entity/Product";
import prisma from "../prisma";

export default class ProductRepository {
    private connection: Client;

    constructor() {
        if (!this.connection) {
            this.connection = new Client({
                host: "localhost",
                port: 5432,
                database: 'sa',
                user: 'postgres',
                password: 'senai'
            });
        }
    }

    public async save(product: Product) {
        // try {
        //     this.connection.connect();
        //     const sql = "INSERT INTO product (id, name, category, manufacturer, amount, updateAt, createAt) VALUES ($1, $2, $3, $4, $5, $6, $7)";
        //     const values = [
        //         product.getId(),
        //         product.getName(),
        //         product.getCategory(),
        //         product.getManufacturer(),
        //         product.getAmount(),
        //         product.getUpdateAt(),
        //         product.getCreateAt()
        //     ]

        //     await this.connection.query(sql, values)
        // }catch(error: any){
        //     console.log(error)
        // }finally{
        //     this.connection.end()
        // }

        try {
            await prisma.produto.create({
                data: {
                    id: product.getId(),
                    name: product.getName(),
                    category: product.getCategory(),
                    manufacturer: product.getManufacturer(),
                    amount: Number(product.getAmount()),
                    updateAt: product.getUpdateAt(),
                    createAt: product.getCreateAt()
                }
            })
        } catch (err) {
            console.log(err)
        }
    }


    public async findAll() {
        try {
            return await prisma.produto.findMany();
        } catch (error: any) {
            console.log(error)
        }
    }

    public async findAmountByCategory() {
        try {
            return prisma.produto.groupBy({
                by: ['category'],
                _sum: { amount: true },
                orderBy: { _sum: { amount: 'asc' } }
            })
        } catch (error: any) {
            console.log(error)
        }
    }
    //     public async findById(id: string) {
    //         try {
    //             return prisma.produto.findUnique({
    //                 where: { id: id }
    //             })
    //         } catch (err) {
    //             console.log(err)
    //         }
    //     }
    // 
}
