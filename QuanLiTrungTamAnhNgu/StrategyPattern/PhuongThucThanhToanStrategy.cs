using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLiTrungTamAnhNgu.StrategyPattern
{
    public interface PhuongThucThanhToanStrategy
    {
         decimal ThanhToan(decimal tien);     
    }
}
