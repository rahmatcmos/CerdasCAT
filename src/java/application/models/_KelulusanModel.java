/** 
 * Autogenerated by Recite18th from table ruklis3.kelulusan
 * Don't change this file. Instead, change the derived class KelulusanModel
 * 
 */

package application.models;
import recite18th.model.Model;
public class _KelulusanModel extends Model
{
    public String idkelulusan;
    public String nama_kelulusan;
    public _KelulusanModel()
    {
        tableName="kelulusan";
        pkFieldName="idkelulusan";
        fqn = KelulusanModel.class.getName();
        plainClassName = "KelulusanModel";
    }
    public void setIdkelulusan(String idkelulusan)
    {
        this.idkelulusan=idkelulusan;
    }
    public String getIdkelulusan()
    {        return this.idkelulusan;
    }
    public void setNama_kelulusan(String nama_kelulusan)
    {
        this.nama_kelulusan=nama_kelulusan;
    }
    public String getNama_kelulusan()
    {        return this.nama_kelulusan;
    }
    public void get()
    {
        _KelulusanModel result = (_KelulusanModel) super.getModel();
        if(result!=null)
        {
            setIdkelulusan(result.getIdkelulusan());
            setNama_kelulusan(result.getNama_kelulusan());
        }
    }
}
