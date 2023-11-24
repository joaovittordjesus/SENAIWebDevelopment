// Importa os módulos e classes necessárias
import { Component, OnInit } from '@angular/core';
import { OpeningService } from '../opening.service';
import { Opening } from '../models/opening.model';

@Component({
  selector: 'app-openings',
  templateUrl: './openings.component.html',
  styleUrls: ['./openings.component.css'],
})
export class OpeningsComponent implements OnInit {
  public openings: Opening[] = []; // Uma matriz para armazenar as openings
  constructor(private _openingsService: OpeningService) {}
  // Injeta o serviço de openings no construtor do componente
  ngOnInit(): void {
    this.listarOpenings();
    // Executa a função de listagem de openings quando é inicializado
  }
  // Função para listar as openings
  listarOpenings() {
    this._openingsService.getOpenings().subscribe((retornaOpening) => {
      this.openings = retornaOpening.map((item) => {
        // Mapeia os dados retornados para o modelo Opening
        return new Opening(
        item.id,
        item.name,
        item.hpoto,
        item.description,
        item.salario
        );
      });
    });
  }
}
