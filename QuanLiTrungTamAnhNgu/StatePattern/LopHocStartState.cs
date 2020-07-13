using DevExpress.Utils.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLiTrungTamAnhNgu.StatePattern
{
    class LopHocStartState : LopHocState
    {
        EnglishCenterEntities context = new EnglishCenterEntities();

        public override bool Handle()
        {
            return true;
        }

    }
}
