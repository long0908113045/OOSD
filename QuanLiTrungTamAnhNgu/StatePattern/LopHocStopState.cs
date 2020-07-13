using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLiTrungTamAnhNgu.StatePattern
{
    class LopHocStopState : LopHocState
    {
       // EnglishCenterEntities context = new EnglishCenterEntities();

        public override bool Handle()
        {
            return false;
        }

    }
}
