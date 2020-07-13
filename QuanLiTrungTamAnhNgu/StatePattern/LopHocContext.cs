using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLiTrungTamAnhNgu.StatePattern
{
    class LopHocContext
    {
        EnglishCenterEntities context = new EnglishCenterEntities();
        private LopHocState state;
        
        public LopHocContext()
        {
            var count = context.sp_demSoLuong(Global.LopHocID);
            int ordercount = count.SingleOrDefault().Value;
            if(ordercount<=2)
            {
                this.state = new LopHocStartState();
            }
            else
            {
                this.state = new LopHocStopState(); 
            }
            
        }

        public LopHocState State
        {
            get { return state; }
            set
            {
                state = value;
            }
        }
       
        public bool Request()
        {
           return state.Handle();
        }

    }
}
