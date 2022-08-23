
import java.time.LocalDate;


public class Cuenta {
    
    private String propietario;
    private String numero;
    private String tipo;
    private int saldo;
    private LocalDate fechaVencimiento;

    public Cuenta(String propietario, String numero, String tipo, int saldo, LocalDate fechaVencimiento) {
        this.propietario = propietario;
        this.numero = numero;
        this.tipo = tipo;
        this.saldo = saldo;
        this.fechaVencimiento = fechaVencimiento;
    }

    public Cuenta() {
    }

    public String getPropietario() {
        return propietario;
    }

    public void setPropietario(String propietario) {
        this.propietario = propietario;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getSaldo() {
        return saldo;
    }

    public void setSaldo(int saldo) {
        this.saldo = saldo;
    }

    public LocalDate getFechaVencimiento() {
        return fechaVencimiento;
    }

    public void setFechaVencimiento(LocalDate fechaVencimiento) {
        this.fechaVencimiento = fechaVencimiento;
    }
    
    public void consultarSaldo(){
        System.out.println("Su saldo es de : $" + saldo);
    }
    public void abonar(int monto){
        saldo = saldo + monto;
        System.out.println("Abono exitoso, nuevo saldo: $" + saldo);
        
    }
    public void retirar(int monto){
        saldo = saldo - monto;
        System.out.println("ya se retiro su dinero, su nuevo saldo es : $" + saldo);
               
        
    }
    public boolean comprobarVigencia(){
        return LocalDate.now().isBefore(fechaVencimiento);
    }
}

---------------------------------------------------------------------------------------------------


import java.time.LocalDate;

public class Test {
    public static void main(String[] args) {
        Cuenta c=new Cuenta("Juam", "123", "Vista", 10000, LocalDate.parse("2022-08-25"));
        c.consultarSaldo();
        c.abonar(30000);
        c.retirar(15000);
        System.out.println(c.comprobarVigencia());
    
    }
    
    
}
