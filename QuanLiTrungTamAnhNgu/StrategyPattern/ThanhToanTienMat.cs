using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLiTrungTamAnhNgu.StrategyPattern
{
    class ThanhToanTienMat : PhuongThucThanhToanStrategy
    {
        public decimal ThanhToan(decimal tien)
        {
            return tien;
        }
    }
}
