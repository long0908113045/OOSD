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
        
        public LopHocContext(int LopHocID)
        {
            int SoLuongHoVien = Convert.ToInt32((from lophoc in context.fn_ListLopHoc()
                                  where lophoc.LopHocId == Global.LopHocID
                                  select lophoc.SoLuongHocVien).FirstOrDefault().Value);
            int count = context.sp_demSoLuong(LopHocID).SingleOrDefault().Value;
            
            if(count < SoLuongHoVien)
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
