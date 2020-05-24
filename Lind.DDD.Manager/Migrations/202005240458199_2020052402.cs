namespace Lind.DDD.Manager.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class _2020052402 : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Evaluations",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Star = c.Int(nullable: false),
                        Content = c.String(),
                        evaluateUserId = c.Int(nullable: false),
                        evaluateName = c.String(),
                        DataCreateDateTime = c.DateTime(nullable: false),
                        LastModifyTime = c.DateTime(nullable: false),
                        LastModifyUserId = c.Int(nullable: false),
                        DataStatus = c.Int(nullable: false),
                        IsDeleted = c.Short(nullable: false),
                    })
                .PrimaryKey(t => t.ID);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Evaluations");
        }
    }
}
