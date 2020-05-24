using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Lind.DDD.Manager.Models
{
    /// <summary>
    /// 评价表
    /// </summary>
    public class Evaluation : Lind.DDD.Domain.EntityBase
    {
        /// <summary>
        /// 标识列
        /// </summary>
        [DisplayName("编号"), Column("ID"), Required, Key]
        public int Id { get; set; }
        /// <summary>
        /// 星级
        /// </summary>
      [DisplayName("星级")]
        public int Star { get; set; }
        /// <summary>
        /// 内容
        /// </summary>
        [DisplayName("内容")]
        public String Content { get; set; }
        /// <summary>
        /// 评价人ID
        /// </summary>
        [DisplayName("评价人ID")]
        public int evaluateUserId { get; set; }
        /// <summary>
        /// 评价人名字
        /// </summary>
        [DisplayName("评价人名字")]
        public String evaluateName { get; set; }
    }
}