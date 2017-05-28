/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.hotel.utilitarios;

/**
 *
 * @author Tarcisio
 */
public class ValidaData {

    public static boolean validaData(int dia, int mes, int ano) {
        boolean erroValorMaiorMenor = false; //boolean para verificar se dia ou mês estão acima dos maiores valores permitidos
        boolean erroDiaInvalido = false; //boolean para verificar se o dia inserido é válido

        if ((dia > 31 || dia < 1) || (mes > 12 || mes < 1)) {
            erroValorMaiorMenor = true;
        } else {
            if (!erroValorMaiorMenor) {
                if (((mes % 2 == 0 && mes < 8) && mes != 2) && dia > 30) {
                    erroDiaInvalido = true;
                    erroValorMaiorMenor = true;
                } else if ((mes % 2 != 0 && mes >= 8) && dia > 30) {
                    erroDiaInvalido = true;
                    erroValorMaiorMenor = true;
                } else if (mes == 2 && dia > 28) {
                    if (ano % 4 == 0) {
                        if (ano % 100 == 0) {
                            if (ano % 400 != 0) {
                                erroDiaInvalido = true;
                                erroValorMaiorMenor = true;
                            } else {
                                if (dia > 29) {
                                    erroDiaInvalido = true;
                                    erroValorMaiorMenor = true;
                                }
                            }
                        } else {
                            if (dia > 29) {
                                erroDiaInvalido = true;
                                erroValorMaiorMenor = true;
                            }
                        }
                    } else if (ano % 400 == 0) {
                        if (dia > 29) {
                            erroDiaInvalido = true;
                            erroValorMaiorMenor = true;
                        }
                    } else if (ano % 400 != 0) {
                        erroDiaInvalido = true;
                        erroValorMaiorMenor = true;
                    }
                }
            }
        }

        return !erroDiaInvalido && !erroValorMaiorMenor;
    }

    public static boolean verificaData(String dataEntrada, String dataSaida, String dataVerificar) {
        char[] anoEnt = new char[4];
        char[] anoSai = new char[4];
        char[] anoVer = new char[4];

        char[] mesEnt = new char[2];
        char[] mesSai = new char[2];
        char[] mesVer = new char[2];

        char[] diaEnt = new char[2];
        char[] diaSai = new char[2];
        char[] diaVer = new char[2];

        dataEntrada.getChars(0, 4, anoEnt, 0);
        dataEntrada.getChars(5, 7, mesEnt, 0);
        dataEntrada.getChars(8, 10, diaEnt, 0);

        dataSaida.getChars(0, 4, anoSai, 0);
        dataSaida.getChars(5, 7, mesSai, 0);
        dataSaida.getChars(8, 10, diaSai, 0);

        dataVerificar.getChars(0, 4, anoVer, 0);
        dataVerificar.getChars(5, 7, mesVer, 0);
        dataVerificar.getChars(8, 10, diaVer, 0);

        int diaEntrada = Integer.valueOf(String.copyValueOf(diaEnt)), mesEntrada = Integer.valueOf(String.copyValueOf(mesEnt)), anoEntrada = Integer.valueOf(String.copyValueOf(anoEnt));
        int diaSaida = Integer.valueOf(String.copyValueOf(diaSai)), mesSaida = Integer.valueOf(String.copyValueOf(mesSai)), anoSaida = Integer.valueOf(String.copyValueOf(anoSai));
        int diaVerif = Integer.valueOf(String.copyValueOf(diaVer)), mesVerif = Integer.valueOf(String.copyValueOf(mesVer)), anoVerif = Integer.valueOf(String.copyValueOf(anoVer));

        if ((diaEntrada == diaVerif && mesEntrada == mesVerif && anoEntrada == anoVerif) || (diaSaida == diaVerif && mesSaida == mesVerif && anoSaida == anoVerif)) {
            return false;
        } else {
            while (!(diaEntrada == diaSaida && mesEntrada == mesSaida && anoEntrada == anoSaida)) {
                if (diaEntrada == diaVerif && mesEntrada == mesVerif && anoEntrada == anoVerif) {
                    return false;
                } else {
                    if (validaData(diaEntrada + 1, mesEntrada, anoEntrada)) {
                        diaEntrada++;
                    } else if (validaData(1, mesEntrada + 1, anoEntrada)) {
                        diaEntrada = 1;
                        mesEntrada++;
                    } else if (!validaData(1, mesEntrada + 1, anoEntrada)) {
                        diaEntrada = 1;
                        mesEntrada = 1;
                        anoEntrada++;
                    }
                }
            }
        }

        return true;
    }

    public static boolean validaDuasDatas(String dataEntrada, String dataSaida) {
        char[] anoEnt = new char[4];
        char[] anoSai = new char[4];

        char[] mesEnt = new char[2];
        char[] mesSai = new char[2];

        char[] diaEnt = new char[2];
        char[] diaSai = new char[2];

        dataEntrada.getChars(0, 4, anoEnt, 0);
        dataEntrada.getChars(5, 7, mesEnt, 0);
        dataEntrada.getChars(8, 10, diaEnt, 0);

        dataSaida.getChars(0, 4, anoSai, 0);
        dataSaida.getChars(5, 7, mesSai, 0);
        dataSaida.getChars(8, 10, diaSai, 0);

        int diaEntrada = Integer.valueOf(String.copyValueOf(diaEnt)), mesEntrada = Integer.valueOf(String.copyValueOf(mesEnt)), anoEntrada = Integer.valueOf(String.copyValueOf(anoEnt));
        int diaSaida = Integer.valueOf(String.copyValueOf(diaSai)), mesSaida = Integer.valueOf(String.copyValueOf(mesSai)), anoSaida = Integer.valueOf(String.copyValueOf(anoSai));

        if (diaEntrada == diaSaida && mesEntrada == mesSaida && anoEntrada == anoSaida) {
            return false; //se o hotel trabalha com pernoites, não pode entrar e sair no msm dia.
        } else {
            if (anoSaida < anoEntrada || (mesSaida < mesEntrada && anoSaida == anoEntrada)) {
                return false;
            } else {
                if (diaEntrada > diaSaida && mesEntrada == mesSaida && anoEntrada == anoSaida) {
                    return false;
                }
            }
        }
        return true;
    }

    public static String consertaData(int dia, int mes, int ano) {
        String diaS = String.valueOf(dia);
        String mesS = String.valueOf(mes);
        String anoS = String.valueOf(ano);

        if (diaS.length() == 1) {
            diaS = "0" + diaS;
        }
        if (mesS.length() == 1) {
            mesS = "0" + mesS;
        }
        if (anoS.length() == 1) {
            anoS = "000" + anoS;
        } else if (anoS.length() == 2) {
            anoS = "00" + anoS;
        } else if (anoS.length() == 3) {
            anoS = "0" + anoS;
        }

        return anoS + "/" + mesS + "/" + diaS;
    }

    public static String converteData(String data) {
        data = data.replace('-', '/');
        return data;
    }

    public static int contaDias(String dataEntrada, String dataSaida) {
        dataEntrada = converteData(dataEntrada);
        dataSaida = converteData(dataSaida);

        char[] anoEnt = new char[4];
        char[] anoSai = new char[4];

        char[] mesEnt = new char[2];
        char[] mesSai = new char[2];

        char[] diaEnt = new char[2];
        char[] diaSai = new char[2];

        dataEntrada.getChars(0, 4, anoEnt, 0);
        dataEntrada.getChars(5, 7, mesEnt, 0);
        dataEntrada.getChars(8, 10, diaEnt, 0);

        dataSaida.getChars(0, 4, anoSai, 0);
        dataSaida.getChars(5, 7, mesSai, 0);
        dataSaida.getChars(8, 10, diaSai, 0);

        int diaEntrada = Integer.valueOf(String.copyValueOf(diaEnt)), mesEntrada = Integer.valueOf(String.copyValueOf(mesEnt)), anoEntrada = Integer.valueOf(String.copyValueOf(anoEnt));
        int diaSaida = Integer.valueOf(String.copyValueOf(diaSai)), mesSaida = Integer.valueOf(String.copyValueOf(mesSai)), anoSaida = Integer.valueOf(String.copyValueOf(anoSai));

        int contadorDeDias = 0;

        while (!(diaEntrada == diaSaida && mesEntrada == mesSaida && anoEntrada == anoSaida)) {
            System.out.println(diaEntrada + "/" + mesEntrada + "/" + anoEntrada);
            if (validaData(diaEntrada + 1, mesEntrada, anoEntrada)) {
                diaEntrada++;
            } else if (!validaData(diaEntrada + 1, mesEntrada, anoEntrada)) {
                if (validaData(1, mesEntrada + 1, anoEntrada)) {
                    diaEntrada = 1;
                    mesEntrada++;
                } else {
                    diaEntrada = 1;
                    mesEntrada = 1;
                    anoEntrada++;
                }
            } else if (!validaData(1, mesEntrada + 1, anoEntrada)) {
                diaEntrada = 1;
                mesEntrada = 1;
                anoEntrada++;
            }
            contadorDeDias++;
        }

        return contadorDeDias;
    }
}
