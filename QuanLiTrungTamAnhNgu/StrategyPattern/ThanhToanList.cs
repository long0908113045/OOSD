    using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLiTrungTamAnhNgu.StrategyPattern
{
    class ThanhToanList
    {
        private PhuongThucThanhToanStrategy strategy;
        public void setPhuongThucStrategy(PhuongThucThanhToanStrategy strategy)
        {
            this.strategy = strategy;
        }
        public decimal ThanhToan(decimal tien)
        {
           return strategy.ThanhToan(tien);
        }
    }
}
