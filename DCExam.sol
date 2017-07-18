pragma solidity ^0.4.11;


contract DCExam {

    struct examenDetail {
    string examenNaam;
    uint256 examenCijfer;
    }

    struct examenKanidaat {
    uint256 studentNummer;
    mapping (string => examenDetail) examenDetails;
    }

    mapping (uint256 => examenKanidaat) examenOf;

    function newExam(uint256 studentNummer, string examenNaam, uint256 examenCijfer) {

        examenOf[studentNummer] = examenKanidaat(studentNummer);

        examenKanidaat c = examenOf[studentNummer];

        c.examenDetails[examenNaam] = examenDetail(examenNaam, examenCijfer);
    }

    function getExam(uint256 studentNummer, string examenNaam) constant returns (uint256) {
        return examenOf[studentNummer].examenDetails[examenNaam].examenCijfer;
    }

    function checkIfGeslaagd(uint256 studentNummer) constant returns (string) {
        if (examenOf[studentNummer].examenDetails['Nederlands'].examenCijfer >= 5) {
            if (examenOf[studentNummer].examenDetails['Engels'].examenCijfer >= 5) {
                if (examenOf[studentNummer].examenDetails['Kerntaken'].examenCijfer >= 5) {
                    return "Yes :)";
                }
            }
        }

        return "NO :(";
    }


}