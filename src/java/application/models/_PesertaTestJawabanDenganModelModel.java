/** 
 * Autogenerated by Recite18th from table ruklis3.peserta_test_jawaban_dengan_model
 * Don't change this file. Instead, change the derived class PesertaTestJawabanDenganModelModel
 * 
 */

package application.models;
import recite18th.model.Model;
public class _PesertaTestJawabanDenganModelModel extends Model
{
    public String idpeserta_test_jawaban_dengan_model;
    public String idpeserta_test;
    public String idsoal;
    public String jawaban;
    public String nilai;
    public String thetaAwal;
    public String b;
    public String P;
    public String Q;
    public String PQ;
    public String SE;
    public String selisihSE;
    public String skor;
    public String thetaAkhir;
    public String waktu;
    public _PesertaTestJawabanDenganModelModel()
    {
        tableName="peserta_test_jawaban_dengan_model";
        pkFieldName="idpeserta_test_jawaban_dengan_model";
        fqn = PesertaTestJawabanDenganModelModel.class.getName();
        plainClassName = "PesertaTestJawabanDenganModelModel";
    }
    public void setIdpeserta_test_jawaban_dengan_model(String idpeserta_test_jawaban_dengan_model)
    {
        this.idpeserta_test_jawaban_dengan_model=idpeserta_test_jawaban_dengan_model;
    }
    public String getIdpeserta_test_jawaban_dengan_model()
    {        return this.idpeserta_test_jawaban_dengan_model;
    }
    public void setIdpeserta_test(String idpeserta_test)
    {
        this.idpeserta_test=idpeserta_test;
    }
    public String getIdpeserta_test()
    {        return this.idpeserta_test;
    }
    public void setIdsoal(String idsoal)
    {
        this.idsoal=idsoal;
    }
    public String getIdsoal()
    {        return this.idsoal;
    }
    public void setJawaban(String jawaban)
    {
        this.jawaban=jawaban;
    }
    public String getJawaban()
    {        return this.jawaban;
    }
    public void setNilai(String nilai)
    {
        this.nilai=nilai;
    }
    public String getNilai()
    {        return this.nilai;
    }
    public void setThetaAwal(String thetaAwal)
    {
        this.thetaAwal=thetaAwal;
    }
    public String getThetaAwal()
    {        return this.thetaAwal;
    }
    public void setB(String b)
    {
        this.b=b;
    }
    public String getB()
    {        return this.b;
    }
    public void setP(String P)
    {
        this.P=P;
    }
    public String getP()
    {        return this.P;
    }
    public void setQ(String Q)
    {
        this.Q=Q;
    }
    public String getQ()
    {        return this.Q;
    }
    public void setPQ(String PQ)
    {
        this.PQ=PQ;
    }
    public String getPQ()
    {        return this.PQ;
    }
    public void setSE(String SE)
    {
        this.SE=SE;
    }
    public String getSE()
    {        return this.SE;
    }
    public void setSelisihSE(String selisihSE)
    {
        this.selisihSE=selisihSE;
    }
    public String getSelisihSE()
    {        return this.selisihSE;
    }
    public void setSkor(String skor)
    {
        this.skor=skor;
    }
    public String getSkor()
    {        return this.skor;
    }
    public void setThetaAkhir(String thetaAkhir)
    {
        this.thetaAkhir=thetaAkhir;
    }
    public String getThetaAkhir()
    {        return this.thetaAkhir;
    }
    public void setWaktu(String waktu)
    {
        this.waktu=waktu;
    }
    public String getWaktu()
    {        return this.waktu;
    }
    public void get()
    {
        _PesertaTestJawabanDenganModelModel result = (_PesertaTestJawabanDenganModelModel) super.getModel();
        if(result!=null)
        {
            setIdpeserta_test_jawaban_dengan_model(result.getIdpeserta_test_jawaban_dengan_model());
            setIdpeserta_test(result.getIdpeserta_test());
            setIdsoal(result.getIdsoal());
            setJawaban(result.getJawaban());
            setNilai(result.getNilai());
            setThetaAwal(result.getThetaAwal());
            setB(result.getB());
            setP(result.getP());
            setQ(result.getQ());
            setPQ(result.getPQ());
            setSE(result.getSE());
            setSelisihSE(result.getSelisihSE());
            setSkor(result.getSkor());
            setThetaAkhir(result.getThetaAkhir());
            setWaktu(result.getWaktu());
        }
    }
}
