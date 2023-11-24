// Importa os módulos necessáriosregisterVaga
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Openings } from '../model/openings.model';
@Injectable({
providedIn: 'root',
})
export class OpeningsService {
private apiUrl = 'http://localhost:3000/openings'; // Caminho para o arquivo JSON
constructor(private http: HttpClient) {}
// Obtém a lista de openings a partir do arquivo JSON
getOpenings(): Observable<Openings[]> {
return this.http.get<Openings[]>(this.apiUrl);
}
// Cadastra uma nova openings no servidor
registerOpening(openings: Openings): Observable<Openings[]> {
return this.http.post<Openings[]>(this.apiUrl, openings);
}
// Atualiza uma openings existente no servidor
updateOpening(id: any, openings: Openings): Observable<Openings[]> {
const urlUpdate = `${this.apiUrl}/${id}`;
return this.http.put<Openings[]>(urlUpdate, openings);
}
// Remove uma openings do servidor
removeOpening(id: any): Observable<Openings[]> {
const urlDelete = `${this.apiUrl}/${id}`;
return this.http.delete<Openings[]>(urlDelete);
}
}
