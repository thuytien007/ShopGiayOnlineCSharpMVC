//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebMVCDemo.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class SanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SanPham()
        {
            this.ChiTietSanPhams = new HashSet<ChiTietSanPham>();
        }
    
        public int MaSP { get; set; }
        public int MaNhom { get; set; }
        public string TenSP { get; set; }
        public Nullable<int> Gia { get; set; }
        public string MoTa { get; set; }
        public string Img { get; set; }
        public Nullable<bool> Moi { get; set; }
        public string Meta { get; set; }
        public Nullable<bool> Hide { get; set; }
        public Nullable<int> Order { get; set; }
        public Nullable<System.DateTime> DateBegin { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietSanPham> ChiTietSanPhams { get; set; }
        public virtual NhomSanPham NhomSanPham { get; set; }
    }
}